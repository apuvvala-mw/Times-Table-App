function plan = buildfile
plan = buildplan(localfunctions);
plan.DefaultTasks = "archive";
plan("archive").Dependencies = "test";
end

function testTask(~)
% Run unit tests
results = runtests(IncludeSubfolders=true,OutputDetail="terse");
assertSuccess(results);
end

function archiveTask(~)
% Create ZIP file
zipFileName = "source_" + ...
    string(datetime("now",Format="yyyyMMdd'T'HHmmss"));
zip(zipFileName,"*")
end
