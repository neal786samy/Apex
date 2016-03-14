public class Count
{ 
    public void charCount(String str)
    {
        integer count=0;
        String[] chars=str.split('');
        for(String i:chars)
        {
            count++;
        }
        System.debug('Count='+count);
    }
}