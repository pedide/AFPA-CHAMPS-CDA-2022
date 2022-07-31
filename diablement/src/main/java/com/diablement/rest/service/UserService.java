package com.diablement.rest.service;

import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.web.multipart.MultipartFile;

import com.diablement.rest.entity.User;
import com.diablement.rest.exception.domaine.EmailExistException;
import com.diablement.rest.exception.domaine.EmailNotFoundException;
import com.diablement.rest.exception.domaine.NotAnImageFileException;
import com.diablement.rest.exception.domaine.UserNotFoundException;
import com.diablement.rest.exception.domaine.UsernameExistException;


public interface UserService {
	User register(String firstname, String lastname, String username, String email) throws MessagingException, UserNotFoundException, EmailExistException, UsernameExistException;
	
	List<User> getUser();
	
	User findUserByUsername(String username);
	
	User findUserByEmail(String email);

	User addNewUser(String firstname, String lastname, String username, String email, String role, boolean isNotLocked, boolean isActive, MultipartFile profileImage) throws IOException, UserNotFoundException, EmailExistException, UsernameExistException, NotAnImageFileException;
	
	User updateUser(String currentUsername, String newFirstname, String newLastname, String newUsername, String newEmail, String role, boolean isNotLocked, boolean isActive, MultipartFile profileImage) throws UserNotFoundException, EmailExistException, UsernameExistException, IOException, NotAnImageFileException;

	void deleteUser(long id);
	
	void resetPassword(String email) throws EmailNotFoundException, MessagingException;
	
	User updateProfileImage(String username, MultipartFile profileImage) throws IOException, UserNotFoundException, EmailExistException, UsernameExistException, NotAnImageFileException;
}
