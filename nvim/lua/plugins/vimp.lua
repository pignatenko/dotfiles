plugin = {
  'svermeulen/vimpeccable',
  config = function ()
    require('keybindings').run()
    -- TODO: Needed?
    -- local vimp = require('vimp')
    -- vimp.add_chord_cancellations('n', '<leader>')
  end
}

return plugin
