public class StringOperations
{
	public  void reverse(String stringToReverse )
	{
		String stringTemp = stringToReverse;
		String stringReversed = stringTemp.reverse();    
		system.debug('Reverse string of '+stringToReverse+' is '+stringReversed);
	}
	
	public  void StringReplace(String stringRep)
	{
	 	String stringTemp1 = stringRep;
		system.debug('Original String---'+stringRep+' Replacing @ with A ---- Changed String is' + stringTemp1.replace('@','A'));
	 	
	}
	
	public  void subString(String stringSub)
	{
	 	//String stringRep1 = stringSub;
		system.debug(stringSub.substring(11,stringSub.length()));
	}
	
	public  void CaseNSpace(String stringSpace)
	{
	 	String stringRep2 = stringSpace;
		system.debug('The String without Whitespaces is: ' + stringRep2.deleteWhitespace());
		String upperCase = stringRep2.toUpperCase();
  		system.debug('The Upper case String is: ' +upperCase);
  		String lowerCase = stringRep2.toLowerCase();
  		system.debug('The Lower case String is: ' +lowerCase);
  		system.debug('Split is : '+ stringRep2.split(''));
  		String splitString=stringSpace;
  		system.debug('Split is : '+ splitString.split(' '));
	}
	 	
	 	
}