module xiaoliwang/redsync_learn

go 1.22.1

replace github.com/go-redsync/redsync/v4 => ./redsync

require (
	github.com/go-redsync/redsync/v4 v4.12.1
	github.com/redis/go-redis/v9 v9.5.1
)

require (
	github.com/cespare/xxhash/v2 v2.2.0 // indirect
	github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f // indirect
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
)
