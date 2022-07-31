export interface CustomHttpResponse{
    httpStatusCode:number;//exemple: error 404
    httpStatus:string;//exemple : not found
    reason:string;//exemple :page not found
    message:string;
}