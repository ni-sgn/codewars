namespace domain.models;

public class solution {
  public Guid id { get; set; } 
  public kata kata { get; set; } = null!;
  public language language { get; set; } = null!;
  public status status { get; set; }
}
