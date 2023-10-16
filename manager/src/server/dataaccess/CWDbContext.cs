namespace dataaccess;

using Microsoft.EntityFrameworkCore;
using domain.models; 

public class CWDbContext : DbContext {
  public CWDbContext(DbContextOptions options) : base(options) {
  } 

  public DbSet<language> languages { get; set; }
  public DbSet<status> statuses { get; set; }
  public DbSet<kata> katas { get; set; }
  public DbSet<solution> solutions { get; set; }

  protected override void OnModelCreating(ModelBuilder modelBuilder) {
    modelBuilder.Entity<language>()
      .HasKey(e => e.id);
    modelBuilder.Entity<status>()
      .HasKey(e => e.id);
    modelBuilder.Entity<kata>()
      .HasKey(e => e.id);
    modelBuilder.Entity<solution>()
      .HasKey(e => e.id);
  }
}
