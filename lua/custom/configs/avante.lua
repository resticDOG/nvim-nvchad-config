local present, avante = pcall(require, "avante")
if not present then
  return
end

avante.setup {
  debug = true,
  provider = "qwen3", -- 在 Aider 模式或 Cursor 规划模式的规划阶段使用的提供者
  providers = {
    groq = {
      __inherited_from = "openai",
      api_key_name = "GROQ_API_KEY",
      endpoint = "https://api.groq.com/openai/v1/",
      model = "llama-3.1-70b-versatile",
    },
    github_model = {
      __inherited_from = "openai",
      api_key_name = "GITHUB_API_KEY",
      endpoint = "https://models.inference.ai.azure.com/chat/completions#",
      model = "gpt-4o",
    },
    ollama = {
      __inherited_from = "openai",
      api_key_name = "",
      endpoint = "http://10.1.1.63:11434/v1",
      model = "qwen2.5-coder",
    },
    deepseek = {
      __inherited_from = "openai",
      api_key_name = "VECTORAI_API_KEY",
      endpoint = "https://vectorai.huidatech.cn/v1",
      model = "deepseek-v3",
    },
    qwen3 = {
      __inherited_from = "openai",
      api_key_name = "BAILIAN_API_KEY",
      endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
      model = "qwen3-235b-a22b",
    },
    openrouter_claude_37 = {
      __inherited_from = "openai",
      api_key_name = "OPENROUTER_API_KEY",
      endpoint = "https://openrouter.ai/api/v1",
      model = "anthropic/claude-3.7-sonnet",
    },
    openrouter_gemini = {
      __inherited_from = "openai",
      api_key_name = "OPENROUTER_API_KEY",
      endpoint = "https://openrouter.ai/api/v1",
      model = "google/gemini-2.5-flash",
    },
    deepseek_newapi = {
      __inherited_from = "openai",
      api_key_name = "NEW_API_KEY",
      endpoint = "https://newapi.linkzz.hm/v1",
      model = "deepseek-v3",
    },
    xai = {
      __inherited_from = "openai",
      api_key_name = "NEW_API_KEY",
      endpoint = "https://newapi.linkzz.hm/v1",
      model = "grok-3-fast-beta",
    },
  },
}
