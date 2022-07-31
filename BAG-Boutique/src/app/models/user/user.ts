export class User{
public  id : number;//id for data base
public  userId : string;//id of the user
public  firstName : string;
public  lastName : string;
public  username : string;
//public  password : String;
public  email : string;
public  profileImageUrl : string;
public  lastLoginDate : Date;
public  lastLoginDateDisplay : Date;
public  joinDate : Date;
public  role : string;//ROLE_USER(read, edit),ROLE_Admin(delete)
public  authorities : string [];//Are perssions:read, edit,delete
public  isActive : boolean;
public  isNotLocked : boolean;


constructor(){
    this.id=0,
    this.userId='',
    this.firstName='',
    this.lastName='',
    this.username='',
    //this.password='',
    this.email='',
    this.profileImageUrl='',
    this.lastLoginDate=new Date(),
    this.lastLoginDateDisplay=new Date(),
    this.joinDate=new Date(),
    this.role='',
    this.authorities=[],
    this.isActive=false,
    this.isNotLocked=false

}
}
