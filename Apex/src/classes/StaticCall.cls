public class StaticCall 
{
	//String NonStatic;
	//Static String staticV;
	public static void staticMethod() 
	{
        System.debug('Hello');
	}
	public StaticCall() 
	{
        StaticCall.staticMethod(); 
        staticMethod();
	}

	public void secondMethod() 
	{
        System.debug('Hello World');
	}
}