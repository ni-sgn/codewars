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

builder.Services.AddCors(options =>
    options.AddDefaultPolicy(policy => { 
      policy.WithOrigins(
          "http://localhost:8000"
          );
      })
    );

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.MapGet("get-user", () => {
    return "nika saganelidze";
    });

app.MapGet("create-kata", () => {
    try {
    var add_uc = new application.usecases.addkata_usecase(
          builder.Services
          .BuildServiceProvider()
          .GetService(typeof(CWDbContext))
          as CWDbContext ?? throw new Exception("can not be null")   
        );
    add_uc.addkata("123ss");
    return "succesfully added";
    } catch (Exception ex){
      return ex.Message;
    }
    });

app.UseHttpsRedirection();

app.UseCors();

app.UseAuthorization();

app.MapControllers();

app.Run();
