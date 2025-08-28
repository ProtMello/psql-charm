// query.go
package main

import (
	"context"
	"fmt"
	"log"
	"os"

	em "neat_reserve/sql/embedded"

	"github.com/jackc/pgx/v5"
)

const dsn = "postgres://postgres:postgres@localhost:5432/neat_reserve?sslmode=disable"

func main() {
	if len(os.Args) != 3 {
		log.Fatalf("usage: go run ./query.go <q01|q02|...|q10> [arg]")
	}

	qname, arg := os.Args[1], os.Args[2]

	queries := map[string]string{
		"q01": em.Q01, "q02": em.Q02, "q03": em.Q03, "q04": em.Q04, "q05": em.Q05,
		"q06": em.Q06, "q07": em.Q07, "q08": em.Q08, "q09": em.Q09, "q10": em.Q10,
	}

	sql, ok := queries[qname]
	if !ok {
		log.Fatalf("unknown query %q", qname)
	}

	// arg parsing: ints -> int64, "null" -> nil, else string

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

	rows, err := tx.Query(ctx, sql, arg)
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

	if err := tx.Commit(ctx); err != nil {
		log.Fatal(err)
	}
}
