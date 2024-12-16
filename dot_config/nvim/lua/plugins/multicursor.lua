return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    local set = vim.keymap.set

    -- Add or skip cursor above/below the main cursor.
    set({"n", "v"}, "<up>", function() mc.lineAddCursor(-1) end, { desc = "foo" })
    set({"n", "v"}, "<down>", function() mc.lineAddCursor(1) end)
    set({"n", "v"}, "<leader><up>", function() mc.lineSkipCursor(-1) end)
    set({"n", "v"}, "<leader><down>", function() mc.lineSkipCursor(1) end)

    -- Add a new cursor by matching word/selection
    set({"n", "v"}, ",a", function() mc.matchAddCursor(1) end, { desc = "Add cursor by matching word/selection" })
    set({"n", "v"}, ",A", function() mc.matchAddCursor(-1) end, { desc = "Add cursor by matching word/selection (reverse)" })
    -- Add all matches in the document
    set({"n", "v"}, ",l", mc.matchAllAddCursors, { desc = "Add all matches in the document" })

    -- Rotate the main cursor.
    set({"n", "v"}, "<left>", mc.nextCursor)
    set({"n", "v"}, "<right>", mc.prevCursor)

    set("n", "<esc>", function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
        -- Default <esc> handler.
      end
    end)

    -- Split visual selections by regex.
    set("v", "S", mc.splitCursors)

    -- Append/insert for each line of visual selections.
    set("v", "I", mc.insertVisual)
    set("v", "A", mc.appendVisual)

    -- match new cursors within visual selections by regex.
    set("v", "M", mc.matchCursors)
  end
}
