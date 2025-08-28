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

	q := `SELECT DISTINCT s.name
	FROM sailors s
	WHERE NOT EXISTS (
	    SELECT id 
		FROM boats b
	    WHERE b.name = 'Interlake'
	    EXCEPT
	    SELECT bid FROM reserves 
	    WHERE sid = s.id
	);`

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
