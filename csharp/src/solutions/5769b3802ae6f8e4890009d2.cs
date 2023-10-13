namespace kata;
public static class RemovingElements {
  public static object[] RemoveEveryOther(object[] arr) {
    List<object> result = new();
    for (int i = 0; i < arr.Length; i++) {
      if(i % 2 == 0) {
        result.Add(arr[i]);
      }
    }

    return result.ToArray();
  }
}
