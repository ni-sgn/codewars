namespace application.usecases;

using Microsoft.EntityFrameworkCore;
using domain.models;

public class addkata_usecase {

  private DbContext _context;
  public addkata_usecase(DbContext context) {
    _context = context;
  }

  public void addkata(string id) {
    _context.Add(new kata {
        date_creation = DateTime.Now
        ,id = id
        ,name = "test kata"
        });
    _context.SaveChanges();

  }
}
