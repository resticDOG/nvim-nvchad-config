local present, im_select = pcall(require, "im_select")

if not present then
  return
end

require("im_select").setup {
  -- 默认英文输入法
  default_im_select = "1033",

  -- 是否关闭默认恢复
  disable_auto_restore = 0,
  -- exe path 
  default_command = "/mnt/c/Users/linkzz/scoop/apps/im-select/current/im-select.exe"
}

