using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace dataaccess.Migrations
{
    /// <inheritdoc />
    public partial class initial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "katas",
                columns: table => new
                {
                    id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    date_creation = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_katas", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "languages",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    path_solutions = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    date_create = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_languages", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "statuses",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_statuses", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "solutions",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    kataid = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    languageid = table.Column<int>(type: "int", nullable: false),
                    statusid = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_solutions", x => x.id);
                    table.ForeignKey(
                        name: "FK_solutions_katas_kataid",
                        column: x => x.kataid,
                        principalTable: "katas",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_solutions_languages_languageid",
                        column: x => x.languageid,
                        principalTable: "languages",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_solutions_statuses_statusid",
                        column: x => x.statusid,
                        principalTable: "statuses",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_solutions_kataid",
                table: "solutions",
                column: "kataid");

            migrationBuilder.CreateIndex(
                name: "IX_solutions_languageid",
                table: "solutions",
                column: "languageid");

            migrationBuilder.CreateIndex(
                name: "IX_solutions_statusid",
                table: "solutions",
                column: "statusid");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "solutions");

            migrationBuilder.DropTable(
                name: "katas");

            migrationBuilder.DropTable(
                name: "languages");

            migrationBuilder.DropTable(
                name: "statuses");
        }
    }
}
