namespace tests;

using kata;
public class UnitTest1
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
}
