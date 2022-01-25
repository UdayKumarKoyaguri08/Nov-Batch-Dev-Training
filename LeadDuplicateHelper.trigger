trigger LeadDuplicateHelper on Lead (before insert,before update) {
   
   list<Lead> oLead=Trigger.new;
   for(Lead l: oLead)
   {
        
        list<Lead> DupLead=[SELECT Id,Email FROM Lead WHERE Email =:l.Email];
        for(Lead dupl:DupLead)   
        {
           if(l.Email == dupl.Email)
           {
              l.Email.adderror('Email already exists!!! Try New Email');
           }
           
        }
        
   }
}