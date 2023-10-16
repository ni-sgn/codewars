using dataaccess;
using Microsoft.EntityFrameworkCore;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at 
// https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<CWDbContext>(conf =>
    conf.UseSqlServer(
      "Server=localhost,1433;Database=codewars;"
      + "User=SA;Password=P@ssw0rd;TrustServerCertificate=True;"
      ));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.MapGet("get-user", () => {
    return "nika saganelidze";
    }
    );

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
