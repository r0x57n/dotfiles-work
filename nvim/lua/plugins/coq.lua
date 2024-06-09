return {
  {
    "ms-jpq/coq_nvim",
    enabled = false,
    branch = "coq",
    dependencies = {
      "ms-jpq/coq.artifacts",
      "ms-jpq/coq.thirdparty",
    },
    config = function()
      vim.cmd[[ COQnow -s ]]
    end,
  },
  {
    "ms-jpq/coq.artifacts",
    branch = "artifacts",
  },
  {
    "ms-jpq/coq.thirdparty",
    branch = "3p",
  }
}
