public class MyEmpExt {


    public Employee__c employee;
  
    public MyEmpExt() {
        
        employee = [SELECT name, Full_Name__c, Contact__c, Country__c, States__c FROM Employee__c 
                     Where ID = :ApexPages.currentPage().getParameters().get('empId')];
        
    }

    public Employee__c getEmployee(){
        return employee;
    }
    
    
    public PageReference save() {
        update employee;
        return null;
    }

}