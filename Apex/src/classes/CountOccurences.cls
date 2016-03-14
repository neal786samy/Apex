public class CountOccurences 
{
    public void countCharacterOccurrence(String inputString)
    {
        String[] charArray = inputString.split('');        
        Integer count = 0;
        String ch = charArray[count];
  		Map<String,Integer> charCounter = new Map<String,Integer>(); 
  		for(Integer stringIndex = 0; stringIndex < inputString.length(); stringIndex++)
        {
            ch = charArray[stringIndex];
            if(charCounter.containsKey(ch))
            {
                charCounter.put(ch, charCounter.get(ch)+1);
            }
            else
            {
                charCounter.put(ch, 1);
            }
       }

       for(String key:charCounter.keySet())
       {
           System.debug('The letter '+key+ ' :'+charCounter.get(key));
       }
    }   
}