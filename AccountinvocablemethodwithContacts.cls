public class AccountinvocablemethodwithContacts 
{
   @invocableMethod(label='Get Contact Details' description='Use Status flag to find active contacts' 
   category='Account')
   Public static void contacts()
   {
       List<Account> oAccount = new List<Account>();

         for(Account acc :[Select id, Number_of_Active_Contacts__c , (select id, name,Status__c 
              from contacts WHERE Status__c=true ) from account])
         {
                Account oacc = new Account();
                oacc.id = acc.id;
                oacc.Number_of_Active_Contacts__c = acc.contacts.Size();
                oAccount.add(oacc);
         }
         Update oAccount ;
   }

}