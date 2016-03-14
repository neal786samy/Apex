public class SOSLFunctions 
{
    public void soslFunction()
    {
        list<list<SObject>> allObject = new List<List<SObject>> ([find 'test' in all fields returning  Contact, Account, Lead , User]);
        system.debug('allObject'+allObject);
    }
    
}