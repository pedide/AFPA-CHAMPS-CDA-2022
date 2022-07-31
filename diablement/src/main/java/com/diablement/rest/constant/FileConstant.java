package com.diablement.rest.constant;

public class FileConstant {
	public static final String USER_IMAGE_PATH = "/user/image";
	public static final String JPG_EXTENSION = "jpg";//si d'autres format que jpg => {"jpg", "png", ...}
	public static final String USER_FOLDER = System.getProperty("user.home")+"diablement/user/";
	public static final String DIRECTORY_CREATED = "Created directory for : ";
	public static final String DEFAULT_USER_IMAGE_PATH = "/user/image/profile";
	public static final String FILE_SAVED_IN_SYSTEM = "Saved file in file system by name: ";
	public static final String DOT = ".";
	public static final String FORWARD_SLASH = "/";
	public static final String TEMP_PROFILE_IMAGE_BASE_URL = "https://robohash.org";//site genere des photo pour profile
	public static final String NOT_AN_IMAGE_FILE = "is not an image file. Please upload an image file";
}
