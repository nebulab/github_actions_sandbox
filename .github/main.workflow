workflow "QA" {
  resolves = ["Add QA comment"]
  on = "issue_comment"
}

action "Is QA comment?" {
  uses = "actions/bin/filter@c6471707d308175c57dfe91963406ef205837dbd"
  args = "issue_comment start-QA"
}

action "Add QA comment" {
  uses = "./action-add-qa-message"
  needs = ["Is QA comment?"]
  secrets = ["GITHUB_TOKEN"]
}
