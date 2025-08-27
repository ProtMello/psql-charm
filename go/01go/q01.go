// main.go
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

	q := []string{
		`SELECT DISTINCT s.name
	FROM sailors AS s
	JOIN reserves AS r ON r.sid = s.id
	WHERE r.bid = $1`,
	}

	rows, err := conn.Query(ctx, q, 103)
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	for _, q := range q {
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

	if err := tx.Commit(ctx); err != nil {
		log.Fatal(err)
	}
}
