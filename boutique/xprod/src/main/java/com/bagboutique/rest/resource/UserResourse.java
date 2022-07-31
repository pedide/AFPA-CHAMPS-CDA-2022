package com.bagboutique.rest.resource;

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

import com.bagboutique.rest.entity.HttpResponse;
import com.bagboutique.rest.entity.User;
import com.bagboutique.rest.entity.UserPrincipal;
import com.bagboutique.rest.exception.domain.EmailExisteException;
import com.bagboutique.rest.exception.domain.EmailNotFoundException;
import com.bagboutique.rest.exception.domain.ExceptionHandling;
import com.bagboutique.rest.exception.domain.NotAnImageFileException;
import com.bagboutique.rest.exception.domain.UserNotFoundException;
import com.bagboutique.rest.exception.domain.UsernameExistException;
import com.bagboutique.rest.service.UserService;
import com.bagboutique.rest.utility.JWTTokenProvider;

import static com.bagboutique.rest.constant.SecurityConstant.JWT_TOKEN_HEADER;
import static com.bagboutique.rest.constant.fileConstant.*;
import static org.springframework.http.MediaType.IMAGE_JPEG_VALUE;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.mail.MessagingException;

@RestController//notation veut dire que le resultat est un json
@RequestMapping(path={"/","/user"})
@CrossOrigin(origins="http://localhost:4200")

public class UserResourse extends ExceptionHandling {
	private static final String USER_DELETED_SECCESSFULLY = "User deleted seccessfully";
	private static final String EMAIL_SENT = "An email with password was sent to :";
	
	private UserService userService;
	private AuthenticationManager authenticationManager;
	private JWTTokenProvider jwtTokenProvider;
	
	@Autowired
	public UserResourse(UserService userService, AuthenticationManager authenticationManager,
			JWTTokenProvider jwtTokenProvider) {
		
		this.userService = userService;
		this.authenticationManager = authenticationManager;
		this.jwtTokenProvider = jwtTokenProvider;
	}

	

	@GetMapping("/home")
	public String showUser() throws UserNotFoundException {
		//return "Application works !";
		throw new UserNotFoundException("This user is not found ");
	}
	


@PostMapping("/login")
public ResponseEntity<User>login(@RequestBody User user){
	
	authenticate(user.getUsername(),user.getPassword());
	User loginUser=userService.findUserByUsername(user.getUsername());
	UserPrincipal userPrincipal = new UserPrincipal(loginUser);
    HttpHeaders jwtHeader = getJwtHeader(userPrincipal);

	return new ResponseEntity<>(loginUser,jwtHeader,HttpStatus.OK);
	
}



@PostMapping("/register")
public ResponseEntity<User>register(@RequestBody User user){
	User newUser = userService.register(user.getFirstName(), user.getLastName(), user.getUsername(), user.getEmail());
	return new ResponseEntity<>(newUser,HttpStatus.OK);
	
}
@PostMapping("/add")
public ResponseEntity<User>addNewUser(
		@RequestParam ("firstName")String firstName,
		@RequestParam ("lastName")String lastName,
		@RequestParam ("username")String username,
		@RequestParam ("email")String email,
		@RequestParam ("role")String role,
		@RequestParam ("isActive")String isActive,
		@RequestParam ("isNotLocked")String isNotLocked,
		@RequestParam (value="profileImage",required=false)MultipartFile profileImage) throws UserNotFoundException, UsernameExistException, EmailExisteException, IOException, NotAnImageFileException
		
		{
	
	User newUser = userService.addNewUser(firstName, lastName,username,
		  email, role,Boolean.parseBoolean(isActive),
		  Boolean.parseBoolean(isNotLocked), profileImage);
			
	
	return new ResponseEntity<>(newUser,HttpStatus.OK);
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
		@RequestParam(value="profileImage", required=false) MultipartFile profileImage
		)throws UserNotFoundException, UsernameExistException, EmailExisteException, IOException, NotAnImageFileException{
	User updateUser = userService.updateUser(currentUsername,firstName, lastName, username, email, role,
			Boolean.parseBoolean(isNotLocked), 
			Boolean.parseBoolean(isActive), profileImage);
	return new ResponseEntity<>(updateUser, HttpStatus.OK);
	}

@GetMapping("/find/{username}")
public ResponseEntity<User>getUser(@PathVariable("username")String username){
	User user = userService.findUserByUsername(username);
	return new ResponseEntity<>(user,HttpStatus.OK);
	
}

@GetMapping("/list")
public ResponseEntity<List<User>>getAllUsers(){
	List<User>users = userService.getUsers();
	return new ResponseEntity<>(users,HttpStatus.OK);
	
}

@GetMapping("/resetPassword/{email}")
public ResponseEntity<HttpResponse>resetPassword(@PathVariable("email")String email) throws EmailNotFoundException, MessagingException{
	userService.resetPassword(email);
	return  response(HttpStatus.OK,EMAIL_SENT+email);
}


@DeleteMapping("/delete/{id}")
// @PreAuthorize("hasAnyAuthority('user:delete')") 
public ResponseEntity<HttpResponse>deleteUser(@PathVariable("id")long id){
	userService.deleteUser(id);
	return response(HttpStatus.OK,USER_DELETED_SECCESSFULLY+id);
	
}

@PostMapping("/updateProfileImage") 
public ResponseEntity<User>updateProfileImage(
		
		@RequestParam ("username")String username,
		@RequestParam (value="profileImage",required=false)MultipartFile profileImage)
				throws UserNotFoundException, UsernameExistException, IOException, EmailExisteException, NotAnImageFileException{
	
	User updateUser = userService.updateProfileImage(username, profileImage);
			
	
	return new ResponseEntity<>(updateUser,HttpStatus.OK);
}

@GetMapping(path="/image/{username}/{fileName}", produces =IMAGE_JPEG_VALUE)
public byte [] getTempProfileImage(@RequestParam("username")String username,
		@RequestParam("filename")String fileName)
throws IOException{
	URL url = new URL(TEMP_PROFILE_IMAGE_BASE_URL+username);
	ByteArrayOutputStream byteArrayOutputStream=new ByteArrayOutputStream();
	
	try(InputStream  inputStream= url.openStream()){
		int bytesRead;
		byte[]chunk = new byte[1024]; //chunk= un morceau(tableau de byte de 1024
	while((bytesRead=inputStream.read(chunk))>0){
	byteArrayOutputStream.write(chunk,0,bytesRead);//0-1024 bytes
												   //0-1024 bytes
	}
	}
	return byteArrayOutputStream.toByteArray();
}


@GetMapping(path="/image/{profile}/{username}", produces =IMAGE_JPEG_VALUE)
public byte [] getProfileImage(@RequestParam("username")String username,
		@RequestParam("filename")String fileName)
throws IOException{
	URL url = new URL(TEMP_PROFILE_IMAGE_BASE_URL+username);
	return Files.readAllBytes(Paths.get(USER_FOLDER+username+FORWARD_SLASH+fileName));//"user.home"+"xprod/user/paul/paul.jpeg"
}



private ResponseEntity<HttpResponse> response(HttpStatus httpStatus, String message) {
	HttpResponse body=new HttpResponse( httpStatus.value()
			,httpStatus,httpStatus.getReasonPhrase().toUpperCase(),
			message.toUpperCase());
	return new ResponseEntity<>(body,httpStatus);
	

	
}



private HttpHeaders getJwtHeader(UserPrincipal user) {
	HttpHeaders headers =new HttpHeaders();
	headers.add(JWT_TOKEN_HEADER, jwtTokenProvider.generateJwtToken(user));
	
	return headers;
}

private void authenticate(String username, String password) {
	authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username,password));
	
}
}
