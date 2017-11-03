$(document).on('turbolinks:load', () => {
  let onlineList = $('#online-users')
  App.appearance = App.cable.subscriptions.create({
    channel: "AppearanceChannel"
  }, {
    received: (data) => {
      let user = JSON.parse(data);
      if (user.online){
        return onlineList.append(user)
      } else {
        return
      }
    }
  })
})
