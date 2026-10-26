<script setup lang="ts">
import { ref } from 'vue'
import { getHealth } from './api/client'

const providerStatus = ref<'checking' | 'ready' | 'unavailable'>('checking')

void getHealth()
  .then(() => (providerStatus.value = 'ready'))
  .catch(() => (providerStatus.value = 'unavailable'))
</script>

<template>
  <main class="shell">
    <nav
      class="nav"
      aria-label="Main navigation"
    >
      <a
        class="brand"
        href="/"
      >Japan <span>Discovery</span></a>
      <div class="nav-links">
        <a href="#discover">Discover</a>
        <a href="#map">Map</a>
        <a href="#trips">Trips</a>
      </div>
    </nav>

    <section
      class="hero"
      aria-labelledby="hero-title"
    >
      <p class="eyebrow">
        Travel with intention
      </p>
      <h1 id="hero-title">
        Find your next<br><em>Japan moment.</em>
      </h1>
      <p class="lede">
        Explore real places, shape thoughtful itineraries, and keep every detail of your journey in one calm workspace.
      </p>
      <div class="search-row">
        <input
          aria-label="Search Japan"
          placeholder="What would you like to discover?"
          disabled
        >
        <button
          type="button"
          disabled
        >
          Explore
        </button>
      </div>
      <p
        class="status"
        role="status"
      >
        <span :class="['status-dot', providerStatus]" />
        {{ providerStatus === 'ready' ? 'Connected to Japan Discovery' : providerStatus === 'unavailable' ? 'Discovery data is currently unavailable' : 'Connecting to Japan Discovery' }}
      </p>
    </section>

    <section
      class="feature-grid"
      aria-label="Coming soon features"
    >
      <article><span class="number">01</span><h2>Discover</h2><p>Search real places and activities with transparent source information.</p></article>
      <article><span class="number">02</span><h2>Collect</h2><p>Save the ideas that matter and keep your own notes close at hand.</p></article>
      <article><span class="number">03</span><h2>Plan</h2><p>Turn saved places into flexible trips with days, costs, and context.</p></article>
    </section>
  </main>
</template>
