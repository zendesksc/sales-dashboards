Dashboard.create([
  {
    name: 'EMEA Leaderboard Ranking Quarterly',
    url: 'https://salesops.bime.io/dashboard/EMEA-leaderboard-ranking-qtrly#region=EMEA',
    department_id: 1
  },
  {
    name: 'EMEA Leaderboard Ranking Monthly',
    url: 'https://salesops.bime.io/dashboard/EMEA-leaderboard-ranking-mthly#region=EMEA',
    department_id: 1
  }
])

Department.create([
  {
    name: 'Sales'
  },
  {
    name: 'Pre-Sales'
  }
])

Region.create([
  {
    name: 'EMEA'
  },
  {
    name: 'AMER'
  }
])