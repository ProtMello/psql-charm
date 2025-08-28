package main

import (
	"context"
	"fmt"
	"log"

	"github.com/jackc/pgx/v5"
)

func main() {
	const dsn = "postgres://postgres:postgres@localhost:5432/neat_reserve?sslmode=disable"

	ctx := context.Background()
	conn, err := pgx.Connect(ctx, dsn)
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close(ctx)

	tx, err := conn.Begin(ctx)
	if err != nil {
		log.Fatal(err)
	}
	defer tx.Rollback(ctx)

	q := `WITH rs AS (
    SELECT DISTINCT s.name,sid,bid
    FROM sailors s
    JOIN reserves r
    ON r.sid = s.id
	)
	SELECT DISTINCT rs1.name
	FROM rs rs1
	CROSS JOIN rs rs2
	WHERE rs1.name = rs2.name
	AND rs1.bid != rs2.bid;`

	rows, err := conn.Query(ctx, q)
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	for rows.Next() {
		var name string
		if err := rows.Scan(&name); err != nil {
			log.Fatal(err)
		}
		fmt.Println(name)
	}
	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}
}
