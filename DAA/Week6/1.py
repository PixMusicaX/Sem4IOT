def schedule_jobs(profits, deadlines):
    jobs = list(zip(profits, deadlines))
    jobs = sorted(jobs, key=lambda x: x[0], reverse=True)
    slots = [False] * (max(deadlines) + 1)
    total_profit = 0
    scheduled_jobs = []
    for job in jobs:
        for i in range(job[1], 0, -1):
            if slots[i] == False:
                slots[i] = True
                total_profit += job[0]
                scheduled_jobs.append(job)
                break
    return (scheduled_jobs, total_profit)


print("Job Scheduling with Deadlines in Python")
profits = [3, 5, 20, 18, 1, 6, 30]
deadlines = [1, 3, 4, 3, 2, 1, 2]
scheduled_jobs, total_profit = schedule_jobs(profits, deadlines)
print("Scheduled jobs:", scheduled_jobs)
print("Total profit:", total_profit)