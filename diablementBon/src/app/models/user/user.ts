export class User{

    public id:number;//id pour la base de données
	public userId:string;//id de l'utilisateur
	public firstName:string;
	public lastName:string;
	public username:string;
	//public password:string;
	public email:string;
	public profileImageUrl:string;
	public lastLoginDate:Date;
	public lastLoginDateDisplay:Date;
	public joinDate:Date;
	public role:string;//le role de l'utilisateur ROLE_USER(read,edit) ROLE_ADMIN(delete)
	public authorities:string[] ; //les permissions : read, edit, delete
	public isActive:boolean;
	public isNotLocked:boolean;

    constructor(){
        this.id =0;//id pour la base de données
        this.userId ='';//id de l'utilisateur
        this.firstName ='';
        this.lastName ='';
        this.username ='';
        //this.password = ''; il va être envoyé par mail
        this.email ='';
        this.profileImageUrl ='';
        this.lastLoginDate = new Date();
        this.lastLoginDateDisplay = new Date();
        this.joinDate = new Date();
        this.role ='';
        this.authorities = [];
        this.isActive = false;
        this.isNotLocked = false;
    }
}