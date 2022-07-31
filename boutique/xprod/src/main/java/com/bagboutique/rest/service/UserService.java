package com.bagboutique.rest.service;

import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.web.multipart.MultipartFile;

import com.bagboutique.rest.entity.User;
import com.bagboutique.rest.exception.domain.EmailExisteException;
import com.bagboutique.rest.exception.domain.EmailNotFoundException;
import com.bagboutique.rest.exception.domain.NotAnImageFileException;
import com.bagboutique.rest.exception.domain.UserNotFoundException;
import com.bagboutique.rest.exception.domain.UsernameExistException;

import javax.mail.*;

public interface UserService {
     User register (String firstname, String lastname, String username, String email);
     
     List<User>getUsers();
     
     User findUserByUsername(String username);
     
     User findUserByEmail(String email);
	
     User addNewUser (String firstname, String lastname, String username, String email,String role,boolean isNonLocked, boolean isActive, MultipartFile profileImage) throws UserNotFoundException, UsernameExistException, EmailExisteException, IOException, NotAnImageFileException;
     
     User updateUser (String currentUsername, String newFirstname, String newLastname, String newUsername, String newEmail, String role, boolean isNotLocked, boolean isActive, MultipartFile profileImage) throws UserNotFoundException, UsernameExistException, EmailExisteException, IOException, NotAnImageFileException;

     void deleteUser(long id);
     void resetPassword(String email) throws EmailNotFoundException, MessagingException;
     User updateProfileImage(String username, MultipartFile profileImage) throws UserNotFoundException, UsernameExistException, EmailExisteException, IOException, NotAnImageFileException;
     

}
