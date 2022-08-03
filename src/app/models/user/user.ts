export class User{
  profileImage(arg0: string, profileImage: any) {
    throw new Error('Method not implemented.')
  }
	public id:number; //Id for DB
	public userId:string; // Id of the user
	public firstName:string;
	public lastName:string;
	public username:string;
	public password:string;
	public email:string;
	public profileImageUrl:string;
	public lastLoginDate:Date;
	public lastLoginDateDisplay:Date;
	public joinDate:Date;
	public role:string; //ROLE_USER(read, edit), ROLE_ADMIN(delete)
	public authorities:string[]; // Are permissions : read,edit,delete
	public isActive:boolean;
	public isNotLocked:boolean;
    constructor(){
        this.id=0,
        this.userId='',
        this.firstName='',
        this.lastName='',
        this.username='',
        this.password='',
        this.email='',
        this.profileImageUrl='',
        this.lastLoginDate=new Date (),
        this.lastLoginDateDisplay= new Date(),
        this.joinDate= new Date (),
        this.role='',
        this.authorities=[],
        this.isActive= true,
        this.isNotLocked= true;
    }
}