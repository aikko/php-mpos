    <div class="breadcrumbs_container">
      <article class="breadcrumbs"><a href="{$smarty.server.PHP_SELF}">{$GLOBAL.website.name|default:"iWaKuang Pool"}</a> <div class="breadcrumb_divider"></div> <a class="{if ! $smarty.request.action|default:""}current{/if}" {if $smarty.request.action|default:""}href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|default:"home"}"{/if}>{$smarty.request.page|escape|default:"Home"|capitalize}</a>{if $smarty.request.action|default:""} <div class="breadcrumb_divider"></div> <a class="current">{$smarty.request.action|escape|capitalize}</a>{/if}</article>
    </div>
