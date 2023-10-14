using System.Collections.Generic;
using System.Linq;

namespace kata;

public class MultipleOfANumber {
  public static List<int> FindMultiples(int integer, int limit) {
    List<int> multiples_of_integer = new();

    multiples_of_integer = Enumerable.Range(1, limit)
      .Where(x => x % integer == 0)
      .ToList();

    return multiples_of_integer;
  } 
}
