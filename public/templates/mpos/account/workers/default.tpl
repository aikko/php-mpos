<article class="module width_quarter">
  <header><h3 class="">增加新矿工</h3></header>
  <form action="{$smarty.server.PHP_SELF}" method="post">
    <input type="hidden" name="page" value="{$smarty.request.page|escape}">
    <input type="hidden" name="action" value="{$smarty.request.action|escape}">
    <input type="hidden" name="do" value="add">
    <div class="module_content">
      <fieldset>
        <label>矿工名</label>
        <input type="text" name="username" value="" size="10" maxlength="20" required>
      </fieldset>
      <fieldset>
        <label>矿工密码</label>
        <input type="text" name="password" value="" size="10" maxlength="20" required>&nbsp;
      </fieldset>
      <div class="clear"></div>
    </div>
    <footer>
      <div class="submit_link">
        <input type="submit" value="添加新矿工" class="alt_btn">
      </div>
    </footer>
  </form>
</article>

<article class="module width_3_quarter">
  <header><h3 class="">矿工设置 {if $GLOBAL.config.disable_notifications != 1}（如果打开监控，请先在左侧栏通知中打开矿工闲置通知，否则收不到邮件）{/if}</h3></header>
  <form action="{$smarty.server.PHP_SELF}" method="post">
    <input type="hidden" name="page" value="{$smarty.request.page|escape}">
    <input type="hidden" name="action" value="{$smarty.request.action|escape}">
    <input type="hidden" name="do" value="update">
    <table class="tablesorter" cellspacing="0">
      <thead>
        <tr>
          <th align="left">矿工名</th>
          <th align="left">矿工密码</th>
          <th align="center">活动状态</th>
          {if $GLOBAL.config.disable_notifications != 1}<th align="center">监控（邮件通知矿工闲置）</th>{/if}
          <th align="right">Khash/s</th>
          <th align="right">难度</th>
          <th align="center" style="padding-right: 25px;">操作</th>
        </tr>
      </thead>
      <tbody>
        {nocache}
          {section worker $WORKERS}
          {assign var="username" value="."|escape|explode:$WORKERS[worker].username:2} 
        <tr>
          <td align="left"{if $WORKERS[worker].hashrate > 0} style="color: orange"{/if}>{$username.0|escape}.<input name="data[{$WORKERS[worker].id}][username]" value="{$username.1|escape}" size="10" required/></td>
          <td align="left"><input type="text" name="data[{$WORKERS[worker].id}][password]" value="{$WORKERS[worker].password|escape}" size="10" required></td>
          <td align="center"><i class="icon-{if $WORKERS[worker].hashrate > 0}ok{else}cancel{/if}"></i></td>
          {if $GLOBAL.config.disable_notifications != 1}
          <td>
            <span class="toggle">
            <label for="data[{$WORKERS[worker].id}][monitor]">
            <input type="checkbox" class="ios-switch" name="data[{$WORKERS[worker].id}][monitor]" value="1" id="data[{$WORKERS[worker].id}][monitor]" {if $WORKERS[worker].monitor}checked{/if} />
            <div class="switch"></div>
            </label>
            </span>
          </td>
          {/if}
          <td align="right">{$WORKERS[worker].hashrate|number_format}</td>
          <td align="right">{$WORKERS[worker].difficulty|number_format:"2"}</td>
          <td align="center" style="padding-right: 25px;"><a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&do=delete&id={$WORKERS[worker].id|escape}" class="icn_trash"><i class="icon-trash" /></a></td>
        </tr>
          {/section}
        {/nocache}
      </tbody>
    </table>
    <div class="clear"></div>
    <footer>
      <div class="submit_link">
        <input type="submit" class="alt_btn" value="更新">
      </div>
    </footer>
  </form>
</article>
