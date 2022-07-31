package com.diablement.rest.service.impl;

import java.io.IOException;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ExecutionException;

import javax.mail.MessagingException;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.diablement.rest.entity.User;
import com.diablement.rest.entity.UserPrincipal;
import com.diablement.rest.enumeration.Role;
import com.diablement.rest.exception.domaine.EmailExistException;
import com.diablement.rest.exception.domaine.EmailNotFoundException;
import com.diablement.rest.exception.domaine.NotAnImageFileException;
import com.diablement.rest.exception.domaine.UserNotFoundException;
import com.diablement.rest.exception.domaine.UsernameExistException;
import com.diablement.rest.repository.UserRepository;
import com.diablement.rest.service.EmailService;
import com.diablement.rest.service.LoginAttemptService;
import com.diablement.rest.service.UserService;

import static com.diablement.rest.constant.FileConstant.*;
import static com.diablement.rest.constant.UserImplConstant.*;
import static com.diablement.rest.enumeration.Role.*;
import static org.apache.commons.lang3.StringUtils.EMPTY;
import static org.springframework.http.MediaType.*;


@Service
@Transactional
@Qualifier("UserDetailsService")
public class UserServiceImpl implements UserService,UserDetailsService {
	
	
	
	private static final CopyOption REPLACE_EXISTING = null;
	private UserRepository userRepository;
	private Logger LOGGER = LoggerFactory.getLogger(getClass());
	private BCryptPasswordEncoder passwordEncoder;
	private LoginAttemptService loginAttemptService;
	private EmailService emailService;
	
	//constructeur
	@Autowired
	public UserServiceImpl(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder,LoginAttemptService loginAttemptService, EmailService emailService) {
		super();
		this.userRepository = userRepository;
		this.passwordEncoder = passwordEncoder;
		this.loginAttemptService = loginAttemptService;
		this.emailService = emailService;
	}

	@Override
	public UserDetails loadUserByUsername(String username) {
		User user = userRepository.findUserByUsername(username);
		
		if(user == null) {
			LOGGER.error(NO_USER_FOUND_BY_USERNAME+username);
			throw new UsernameNotFoundException(NO_USER_FOUND_BY_USERNAME+username);
		}else {
			try {
				validateLoginAttempt(user);
				
				user.setLastLoginDateDisplay(user.getLastLoginDate());
				user.setLastLoginDate(new Date());
				userRepository.save(user);//on fait appel à la methode save de JPA
				
				UserPrincipal userPrincipal = new UserPrincipal(user);
				LOGGER.error(NO_USER_FOUND_BY_USERNAME+username);

				return userPrincipal;
				
			} catch (ExecutionException e) {
				e.printStackTrace();
			}
		}
		return null;//si pb ça sera ici
	}

	

	@Override
	public User register(String firstname, String lastname, String username, String email) 
			throws MessagingException, UserNotFoundException, EmailExistException, UsernameExistException {
	
			validateNewUsernameAndEmail(StringUtils.EMPTY, username, email);
			User user = new User();
			user.setUserId(generateUserId());
			String password = generatePassword();
			String encodedPassword = encodePassword(password);
			
			user.setFirstName(firstname);
			user.setLastName(lastname);
			user.setUsername(username);
			user.setEmail(email);
			user.setJoinDate(new Date());
			user.setPassword(encodedPassword);
			user.setActive(true);
			user.setNotLocked(true);
			user.setRole(ROLE_USER.name());
			user.setAuthorities(ROLE_USER.getAuthorities());
			user.setProfileImageUrl(getTemporaryProfileImageUrl(username));
			userRepository.save(user);
			LOGGER.info("New user password : "+password);
			//on fait appel à notre service email
			emailService.sendNewPasswordEmail(firstname, password, email);
			
			return user;
		
	}

	@Override
	public List<User> getUser() {
		return userRepository.findAll();
	}

	@Override
	public User findUserByUsername(String username) {
		return userRepository.findUserByUsername(username);
	}

	@Override
	public User findUserByEmail(String email) {
		return userRepository.findUserByEmail(email);
	}
	
	
	@Override
	public User addNewUser(String firstname, String lastname, String username, String email, String role,
			boolean isNotLocked, boolean isActive, MultipartFile profileImage) 
					throws IOException, UserNotFoundException, EmailExistException, UsernameExistException, NotAnImageFileException {

			validateNewUsernameAndEmail(EMPTY, username, email);
			
			User user = new User();
			
			String password = generatePassword();
			
			user.setUserId(generateUserId());
			user.setLastName(lastname);
			user.setUsername(username);
			user.setEmail(email);
			user.setJoinDate(new Date());
			user.setPassword(encodePassword(password));
			user.setActive(isActive);
			user.setNotLocked(isNotLocked);
			user.setRole(getRoleEnumName(role).name());
			user.setAuthorities(getRoleEnumName(role).getAuthorities());
			user.setProfileImageUrl(getTemporaryProfileImageUrl(username));
			userRepository.save(user);
			LOGGER.info("New user password : "+password);
			
			saveProfileImage(user, profileImage);
			return user;

	}

	@Override
	public User updateUser(String currentUsername, String newFirstname, String newLastname, String newUsername,
			String newEmail, String role, boolean isNotLocked, boolean isActive, MultipartFile profileImage) 
					throws UserNotFoundException, EmailExistException, UsernameExistException, IOException, NotAnImageFileException {
		

			User currentUser = validateNewUsernameAndEmail(currentUsername, newUsername, newEmail);
			
			currentUser.setLastName(newFirstname);
			currentUser.setUsername(newLastname);
			currentUser.setUsername(newUsername);
			currentUser.setEmail(newEmail);
			currentUser.setActive(isActive);
			currentUser.setNotLocked(isNotLocked);
			currentUser.setRole(getRoleEnumName(role).name());
			currentUser.setAuthorities(getRoleEnumName(role).getAuthorities());
			
			userRepository.save(currentUser);

			saveProfileImage(currentUser, profileImage);
			return currentUser;

	}

	@Override
	public void deleteUser(long id) {
		userRepository.deleteById(id);
	}

	@Override
	public void resetPassword(String email) throws EmailNotFoundException, MessagingException{
		User user = userRepository.findUserByEmail(email);
		if(user == null) {
			throw new EmailNotFoundException(NO_USER_FOUND_BY_EMAIL);
		}
		String password = generatePassword();
        user.setPassword(password);
        userRepository.save(user);
        emailService.sendNewPasswordEmail(user.getFirstName(), password, user.getEmail());
	}

	@Override
	public User updateProfileImage(String username, MultipartFile profileImage) throws IOException, UserNotFoundException, EmailExistException, UsernameExistException, NotAnImageFileException {

			User user = validateNewUsernameAndEmail(username, null, null);
			saveProfileImage(user, profileImage);
			return user;

	}


	private String encodePassword(String password) {
		return passwordEncoder.encode(password);
	}

	private String generatePassword() {
		// generer pswd avec 10 caracteres alphanumerique
		return RandomStringUtils.randomAlphanumeric(10);
	}

	private String generateUserId() {
		//il va chercher aléatoirement des 10 chiffres
		return RandomStringUtils.randomNumeric(10);
	}

	private User validateNewUsernameAndEmail(String currentUsername, String newUsername, String newEmail)
			throws UserNotFoundException, UsernameExistException, EmailExistException {
		User userByNewUsername = findUserByUsername(newUsername);
		User userByNewEmail = findUserByEmail(newEmail);
		if (StringUtils.isNotBlank(currentUsername)) {

			User currentUser = findUserByUsername(currentUsername);
			if (currentUser == null) {
				throw new UserNotFoundException(NO_USER_FOUND_BY_USERNAME + currentUsername);
			}

			if (userByNewUsername != null && !currentUser.getId().equals(userByNewUsername.getId())) {

				throw new UsernameExistException(USERNAME_ALREADY_EXISTS);
			}

			if (userByNewEmail != null && !currentUser.getId().equals(userByNewEmail.getId())) {
				throw new EmailExistException(EMAIL_ALREADY_EXISTS);
			}
			return currentUser;
		} else {

			if (userByNewUsername != null) {

				throw new UsernameExistException(USERNAME_ALREADY_EXISTS);
			}

			if (userByNewEmail != null) {
				throw new EmailExistException(EMAIL_ALREADY_EXISTS);
			}
			return null;
		}

	}
	
	private void saveProfileImage(User user, MultipartFile profileImage) throws IOException, NotAnImageFileException {
		if(profileImage != null) {
			
			if(!Arrays.asList(IMAGE_JPEG_VALUE, IMAGE_PNG_VALUE, IMAGE_GIF_VALUE).contains(profileImage.getContentType())) {
				throw new NotAnImageFileException(profileImage.getOriginalFilename()+NOT_AN_IMAGE_FILE);
			}
			Path userFolder = Paths.get(USER_FOLDER+user.getUsername()).toAbsolutePath().normalize();
			
			if(Files.exists(userFolder)) {
				Files.createDirectories(userFolder);
				LOGGER.info(DIRECTORY_CREATED);
			}
			Files.deleteIfExists(Paths.get(userFolder+user.getUsername()+DOT+JPG_EXTENSION));
			Files.copy(profileImage.getInputStream(), userFolder.resolve(user.getUsername()+DOT+JPG_EXTENSION), REPLACE_EXISTING);
			
			user.setProfileImageUrl(setProfileImageUrl(user.getUsername()));
			userRepository.save(user);
			LOGGER.info(FILE_SAVED_IN_SYSTEM+profileImage.getOriginalFilename());
			
		}
		
	}
	
	//on va verifie si user n'est pas bloqué ds bd
	private void validateLoginAttempt(User user) throws ExecutionException {
		if(user.isNotLocked()) {
			if(loginAttemptService.hasExceededMaxAttempts(user.getUsername())) {
					user.setNotLocked(false);
			}else {
					user.setNotLocked(true);
			}
				
		}else {
				loginAttemptService.evictUserFromLoginAttemptCache(user.getUsername());
			}
		}

		private String setProfileImageUrl(String username) {
			
			  return ServletUriComponentsBuilder.fromCurrentContextPath().path(USER_IMAGE_PATH + username + FORWARD_SLASH
				        +username+DOT+JPG_EXTENSION).toUriString();
		}

		private String getTemporaryProfileImageUrl(String username) {

			return ServletUriComponentsBuilder.fromCurrentContextPath().path(DEFAULT_USER_IMAGE_PATH + username).toUriString();
		}

	//une liste enumeration de role
	private Role getRoleEnumName(String role) {
		
		return Role.valueOf(role.toUpperCase());
	}
}
