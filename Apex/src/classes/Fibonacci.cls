public class Fibonacci 
{
    public  void fibonacciSeries(Integer num )
    {
        list<Integer> series = new list<Integer>{0,1};
        Integer result;

        for(Integer i=2;i<num;i++)
        {
            result = series[i-1] + series[i-2];
            series.add(result);
        }
       
        for(Integer j=0;j<num;j++)      
        {
            system.debug('The fibonacci Series for '+ num +' numbers is: ' +series[j]);
        }
    }
}