public class ReverseString 
{
	public  void reverse(String stringToReverse )
	{
		String stringTemp = stringToReverse;
		String stringReversed = stringTemp.reverse();    
		system.debug('Reverse string of '+stringToReverse+' is '+stringReversed);
	}
}