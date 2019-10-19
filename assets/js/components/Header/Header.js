import React from 'react';

function Header() {
  return (
    <header>
      <div class="header-left">Mattermost Hacks</div>
      <div class="header-right">
        <input class="header-search" placeholder="Search person/place/thing" />
        <button class="search-button">Search</button>
      </div>
    </header>
  );
}

export default Header;
