namespace pipe;

public class Pipe { 
  public static void Main(string[] args) {

    if (args.Length == 0) {
     throw new Exception("provide kata id"); 
    }
   
    using (FileStream source = 
        File.OpenRead($"../../csharp/src/solutions/{args[0]}.cs"))
    using (FileStream destination = File.Create("output.txt")) {
      source.CopyTo(destination);
    }
  }
}
