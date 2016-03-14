public class checkRecursion 
{
    public static boolean flag = true;
 
    public static boolean runOnce()
    {
        if(flag)
        {
            flag=false;
            return true;
        }
        else
        {
            return flag;
        }
    }
}