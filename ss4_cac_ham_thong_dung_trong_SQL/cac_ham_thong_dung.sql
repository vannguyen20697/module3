use quanlysinhvien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất
select SubId, SubName,`Status`, Credit
from `subject`
where Credit = (select max(Credit) from `subject`);

-- Hiển thị  cac thông tin môn học có điểm thi lớn nhất.
SELECT `subject`.SubID, SubName, Credit, `status`,MarkId, Mark
FROM `subject`
inner join mark
using (SubId)
where Mark = (SELECT max(Mark)  FROM mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.StudentId,student.StudentName, avg(Mark) as avg_mark
from student
join mark
using (StudentId)
group by StudentName, StudentId
order by avg_mark desc;