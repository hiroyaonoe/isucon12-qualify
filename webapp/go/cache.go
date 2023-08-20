package isuports

import (
	"time"

	cache "github.com/patrickmn/go-cache"
)

const (
	CacheNoExpiration = cache.NoExpiration
)

type Cache[V any] struct {
	cache *cache.Cache
}

func NewCache[V any](expiration time.Duration) *Cache[V] {
	return &Cache[V]{
		cache: cache.New(expiration, cache.NoExpiration), // 2つ目はexpireしたキャッシュをclearする間隔でOFFにしている
	}
}

func (c *Cache[V]) Get(key string) (V, bool) {
	v, ok := c.cache.Get(key)
	if ok {
		return v.(V), true
	}
	var defaultValue V
	return defaultValue, false
}

func (c *Cache[V]) Set(k string, v V) {
	c.cache.Set(k, v, cache.DefaultExpiration)
}

func (c *Cache[V]) SetNoExpiration(k string, v V) {
	c.cache.Set(k, v, cache.NoExpiration)
}
