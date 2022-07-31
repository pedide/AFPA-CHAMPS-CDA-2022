package com.diablement.rest.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.diablement.rest.entity.HttpResponse;
import com.diablement.rest.entity.User;
import com.diablement.rest.entity.UserPrincipal;
import com.diablement.rest.exception.domaine.EmailExistException;
import com.diablement.rest.exception.domaine.EmailNotFoundException;
import com.diablement.rest.exception.domaine.ExceptionHandling;
import com.diablement.rest.exception.domaine.NotAnImageFileException;
import com.diablement.rest.exception.domaine.UserNotFoundException;
import com.diablement.rest.exception.domaine.UsernameExistException;
import com.diablement.rest.service.UserService;
import com.diablement.rest.utility.JWTTokenProvider;

import static com.diablement.rest.constant.FileConstant.*;
import static com.diablement.rest.constant.SecurityConstant.JWT_TOKEN_HEADER;
import static org.springframework.http.MediaType.IMAGE_JPEG_VALUE;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.mail.MessagingException;


@RestController
@RequestMapping(path={"/", "/user"})
/*@CrossOrigin("http://localhost:4200")*/
@CrossOrigin("*")
public class UserResource extends ExceptionHandling{
	
	private static final String USER_DELETED_SUCCESSFULLY = "user deleted successfully";
	private static final String EMAIL_SENT = "An email whith a new password was sent to: ";
	

	private UserService userService;
	private AuthenticationManager authenticationManager;
	private JWTTokenProvider jwtTokenProvider;
	
	
	//constructeur
	@Autowired
	public UserResource(UserService userService, AuthenticationManager authenticationManager,
			JWTTokenProvider jwtTokenProvider) {
		super();
		this.userService = userService;
		this.authenticationManager = authenticationManager;
		this.jwtTokenProvider = jwtTokenProvider;
	}

	//method pour afficher nos utilisateurs
	@GetMapping("/home")
	public String showUser() throws UserNotFoundException {
		//return "Application works !";
		throw new UserNotFoundException("This user is not found");
	}
	
	@PostMapping("/login")
	public ResponseEntity<User> login(@RequestBody User user) {
		authenticate(user.getUsername(), user.getPassword());
		User loginUser = userService.findUserByUsername(user.getUsername());
		UserPrincipal userPrincipal = new UserPrincipal(loginUser);
		HttpHeaders jwtHeader = getJwtHeader(userPrincipal);
		
		return new ResponseEntity<>(loginUser, jwtHeader, HttpStatus.OK);
	}
	
	@PostMapping("/register")
	public ResponseEntity<User> register(@RequestBody User user) 
			throws Exception,EmailExistException, UsernameExistException {
		
		User newUser = userService.register(user.getFirstName(), user.getLastName(), user.getUsername(), user.getEmail());
		
		return new ResponseEntity<>(newUser, HttpStatus.OK);
		
	}
	
	@PostMapping("/add")
	public ResponseEntity<User> addNewUser(
		@RequestParam("firstName") String firstName,
		@RequestParam("lastName") String lastName,
		@RequestParam("username") String username,
		@RequestParam("email") String email,
		@RequestParam("role") String role,
		@RequestParam("isActive") String isActive,
		@RequestParam("isNotLocked") String isNotLocked,
		@RequestParam(value="profileImage", required=false) MultipartFile profileImage) 
				throws UserNotFoundException, UsernameExistException, EmailExistException, IOException, NotAnImageFileException{
		
		User newUser = userService.addNewUser(firstName, lastName, username, email, role, 
				Boolean.parseBoolean(isActive), 
				Boolean.parseBoolean(isNotLocked), profileImage);
		
		return new ResponseEntity<>(newUser, HttpStatus.OK);
	}
	
	@PostMapping("/update")
	public ResponseEntity<User> update(
		@RequestParam("currentUsername") String currentUsername,
		@RequestParam("firstName") String firstName,
		@RequestParam("lastName") String lastName,
		@RequestParam("username") String username,
		@RequestParam("email") String email,
		@RequestParam("role") String role,
		@RequestParam("isActive") String isActive,
		@RequestParam("isNotLocked") String isNotLocked,
		@RequestParam(value="profileImage", required=false) MultipartFile profileImage) 
				throws UserNotFoundException, UsernameExistException, EmailExistException, IOException, NotAnImageFileException{
		
		User updateUser = userService.updateUser(currentUsername, firstName, lastName, username, email, role, 
				Boolean.parseBoolean(isActive), 
				Boolean.parseBoolean(isNotLocked), profileImage);
		
		return new ResponseEntity<>(updateUser, HttpStatus.OK);
	}
	
	@GetMapping("/find/{username}")
	public ResponseEntity<User> getUser(@PathVariable("username") String username){
		User user = userService.findUserByUsername(username);
		
		return new ResponseEntity<>(user, HttpStatus.OK);
	}
	
	@GetMapping("/list")
	public ResponseEntity<List<User>> getAllUsers(){
		
		List <User> users= userService.getUser();
		
		return new ResponseEntity<>(users, HttpStatus.OK);
	}
	
	@GetMapping("/resetPassword/{email}")
	public ResponseEntity<HttpResponse> resetPassword(@PathVariable("email") String email) 
			throws EmailNotFoundException, MessagingException{
		userService.resetPassword(email);
		
		return response(HttpStatus.OK, EMAIL_SENT+email);
	}
	
	//seulement super admin peut supprimer
	@DeleteMapping("/delete/{id}")
	//@PreAuthorize("hasAnyAuthority('user:delete')")
	public ResponseEntity<HttpResponse> deleteUser(@PathVariable("id") long id){
		userService.deleteUser(id);
		
		return response(HttpStatus.OK, USER_DELETED_SUCCESSFULLY+id);
	}
	
	@PostMapping("/updateProfileImage")
	public ResponseEntity<User> updateProfileImage(
		@RequestParam("username") String username,
		@RequestParam(value="profileImage") MultipartFile profileImage) 
				throws UserNotFoundException, UsernameExistException, IOException, EmailExistException, NotAnImageFileException{
		
		User user = userService.updateProfileImage(username, profileImage);
		
		return new ResponseEntity<>(user, HttpStatus.OK);
	}
	
	@GetMapping(path="/image/{username}/{fileName}", produces =IMAGE_JPEG_VALUE)
	public byte[] getTempProfileImage(@RequestParam("username") String username, @RequestParam("fileName") String fileName)
	throws IOException{
		URL url = new URL(TEMP_PROFILE_IMAGE_BASE_URL+username);
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		
		try(InputStream inputStream = url.openStream()){
			int bytesRead;
			byte[] chunk = new byte[1024];//on prend un morceau de tab byte
			
			while((bytesRead = inputStream.read(chunk))>0) {
				byteArrayOutputStream.write(chunk, 0, bytesRead);//0 à 1024 bytes
			}
			
		}
		return byteArrayOutputStream.toByteArray();
	}
	
	
	@GetMapping(path="/image/{profile}/{username}", produces =IMAGE_JPEG_VALUE)
	public byte[] getProfileImage(@RequestParam("username") String username, @RequestParam("fileName") String fileName)
	throws IOException{

		return Files.readAllBytes(Paths.get(USER_FOLDER+username+FORWARD_SLASH+fileName));//"user.home"+"xprod/user/Hedi/hedi.jpeg"
	}
	
	private ResponseEntity<HttpResponse> response(HttpStatus httpStatus, String message) {
		HttpResponse body = new HttpResponse(httpStatus.value(), httpStatus, 
				httpStatus.getReasonPhrase().toUpperCase(),
				message.toUpperCase());
		
		return new ResponseEntity<>(body, httpStatus);
	}

	private HttpHeaders getJwtHeader(UserPrincipal user) {
		HttpHeaders headers = new HttpHeaders();
		headers.add(JWT_TOKEN_HEADER, jwtTokenProvider.generateJwtToken(user));
		return headers;
	}

	private void authenticate(String username, String password) {
		authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
		
	}

}
