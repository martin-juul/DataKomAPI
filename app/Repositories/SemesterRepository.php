<?php


namespace App\Repositories;


use App\Models\Semesters;

class SemesterRepository
{
    public function getSemesterCoursesByEducation(int $studentTypeGroupId, int $educationId) {
        $items = Semesters::getSemestersByGroupId($studentTypeGroupId, $educationId);
        $tree = [];

        foreach ($items as $item) {
            $semester = $item->semester;
            $course_no = $item->course_no;
            $name = $item->name;
            $course_length = $item->course_length;
            $school = $item->school_attendance_desc;
            $internship = $item->internship_desc;

            $tree[$semester]['semester'] = $semester;
            $tree[$semester]['courses'][] = [
                'course_no' => $course_no,
                'name' => $name,
                'length' => $course_length,
                'school_attendance_desc' => $school,
                'internship_desc' => $internship,
            ];
        }

        // Removing semester from index.
        // Effectively flattening the array by one dimension.
        return array_values($tree);
    }
}