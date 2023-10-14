namespace tests;

using System.Collections.Generic;
using System.Linq;
using kata;

public class UnitTests1
{
    [Fact]
    public void Test1()
    {
      // assert
      Assert.Equal( new object[]{"Hello", "Hello Again"},
          RemovingElements.RemoveEveryOther(
            new object[]{"Hello", "Goodbye", "Hello Again"}
            )
          );
    }
    
    [Fact]
    public void Test2() {
      Assert.Equal("Hello boss", 
          GrassHoper.Greet("name", "name"));  
    }

    [Fact]
    public void Test3() {
      Assert.Equal(
          new List<int> {5,10,15,20,25}, 
          MultipleOfANumber.FindMultiples(5,25)
          ); 
    }

    //seems it's inclusive
    [Fact]
    public void Is_range_inclusive_question_mark() {
      Enumerable.Range(1,10).ToList()
        .ForEach( x =>
            Console.WriteLine($"{x}")
            );
    }

}
