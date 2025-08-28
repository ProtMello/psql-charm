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

	q := `WITH lubber_r AS (
	SELECT DISTINCT r.bid        
	FROM reserves r
    JOIN sailors s
    ON r.sid = s.id
    WHERE s.name = 'Lubber'
	)
	SELECT DISTINCT b.color         
	FROM boats b
	JOIN lubber_r 
	ON b.id = lubber_r.bid;`

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
