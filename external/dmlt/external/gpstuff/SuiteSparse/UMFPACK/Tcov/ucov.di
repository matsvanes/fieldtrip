#!/bin/csh
# ucov.di: construct gcov files for umfpack, di version

gcov -o umf_i_analyze umf_analyze.c
gcov -o umf_i_apply_order umf_apply_order.c
gcov -o umf_i_colamd umf_colamd.c
gcov -o umf_i_free umf_free.c
gcov -o umf_i_fsize umf_fsize.c
gcov -o umf_i_is_permutation umf_is_permutation.c
gcov -o umf_i_malloc umf_malloc.c
gcov -o umf_i_realloc umf_realloc.c
gcov -o umf_i_report_perm umf_report_perm.c
gcov -o umf_i_singletons umf_singletons.c

gcov -o umf_di_2by2 umf_2by2.c
gcov -o umf_di_blas3_update umf_blas3_update.c
gcov -o umf_di_build_tuples umf_build_tuples.c
gcov -o umf_di_create_element umf_create_element.c
gcov -o umf_di_extend_front umf_extend_front.c
gcov -o umf_di_garbage_collection umf_garbage_collection.c
gcov -o umf_di_get_memory umf_get_memory.c
gcov -o umf_di_grow_front umf_grow_front.c
gcov -o umf_di_init_front umf_init_front.c
gcov -o umf_di_kernel umf_kernel.c
gcov -o umf_di_kernel_init umf_kernel_init.c
gcov -o umf_di_kernel_wrapup umf_kernel_wrapup.c
gcov -o umf_di_local_search umf_local_search.c
gcov -o umf_di_lsolve umf_lsolve.c
gcov -o umf_di_mem_alloc_element umf_mem_alloc_element.c
gcov -o umf_di_mem_alloc_head_block umf_mem_alloc_head_block.c
gcov -o umf_di_mem_alloc_tail_block umf_mem_alloc_tail_block.c
gcov -o umf_di_mem_free_tail_block umf_mem_free_tail_block.c
gcov -o umf_di_mem_init_memoryspace umf_mem_init_memoryspace.c
gcov -o umf_di_report_vector umf_report_vector.c
gcov -o umf_di_row_search umf_row_search.c
gcov -o umf_di_scale umf_scale.c
gcov -o umf_di_scale_column umf_scale_column.c
gcov -o umf_di_set_stats umf_set_stats.c
gcov -o umf_di_solve umf_solve.c
gcov -o umf_di_start_front umf_start_front.c
gcov -o umf_di_symbolic_usage umf_symbolic_usage.c
gcov -o umf_di_transpose umf_transpose.c

gcov -o umf_di_tuple_lengths umf_tuple_lengths.c
gcov -o umf_di_usolve umf_usolve.c
gcov -o umf_di_valid_numeric umf_valid_numeric.c
gcov -o umf_di_valid_symbolic umf_valid_symbolic.c
gcov -o umfpack_di_col_to_triplet umfpack_col_to_triplet.c
gcov -o umfpack_di_defaults umfpack_defaults.c
gcov -o umfpack_di_free_numeric umfpack_free_numeric.c
gcov -o umfpack_di_free_symbolic umfpack_free_symbolic.c
gcov -o umfpack_di_get_lunz umfpack_get_lunz.c
gcov -o umfpack_di_get_numeric umfpack_get_numeric.c
gcov -o umfpack_di_get_determinant umfpack_get_determinant.c
gcov -o umfpack_di_get_symbolic umfpack_get_symbolic.c
gcov -o umfpack_di_load_numeric umfpack_load_numeric.c
gcov -o umfpack_di_load_symbolic umfpack_load_symbolic.c
gcov -o umfpack_di_numeric umfpack_numeric.c
gcov -o umfpack_di_qsymbolic umfpack_qsymbolic.c
gcov -o umfpack_di_report_control umfpack_report_control.c
gcov -o umfpack_di_report_info umfpack_report_info.c
gcov -o umfpack_di_report_matrix umfpack_report_matrix.c
gcov -o umfpack_di_report_numeric umfpack_report_numeric.c
gcov -o umfpack_di_report_perm umfpack_report_perm.c
gcov -o umfpack_di_report_status umfpack_report_status.c
gcov -o umfpack_di_report_symbolic umfpack_report_symbolic.c
gcov -o umfpack_di_report_triplet umfpack_report_triplet.c
gcov -o umfpack_di_report_vector umfpack_report_vector.c
gcov -o umfpack_di_save_numeric umfpack_save_numeric.c
gcov -o umfpack_di_save_symbolic umfpack_save_symbolic.c
gcov -o umfpack_di_scale umfpack_scale.c
gcov -o umfpack_di_symbolic umfpack_symbolic.c
gcov -o umfpack_di_transpose umfpack_transpose.c
gcov -o umfpack_di_triplet_to_col umfpack_triplet_to_col.c

gcov -o umfpack_gn_tictoc umfpack_tictoc.c
gcov -o umfpack_gn_timer umfpack_timer.c

# multiple versions
gcov -o umf_di_uhsolve umf_utsolve.c		; mv -f umf_utsolve.c.gcov umf_uhsolve.c.gcov
gcov -o umf_di_utsolve umf_utsolve.c

gcov -o umf_di_lhsolve umf_ltsolve.c		; mv -f umf_ltsolve.c.gcov umf_lhsolve.c.gcov
gcov -o umf_di_ltsolve umf_ltsolve.c

gcov -o umfpack_di_wsolve umfpack_solve.c	; mv -f umfpack_solve.c.gcov umfpack_wsolve.c.gcov
gcov -o umfpack_di_solve umfpack_solve.c

gcov -o umf_di_store_lu_drop umf_store_lu.c	; mv -f umf_store_lu.c.gcov umf_store_lu_drop.c.gcov
gcov -o umf_di_store_lu umf_store_lu.c

gcov -o umf_di_assemble_fixq umf_assemble.c	; mv -f umf_assemble.c.gcov umf_assemble_fixq.c.gcov
gcov -o umf_di_assemble umf_assemble.c

gcov -o umf_di_triplet_map_x umf_triplet.c	; mv -f umf_triplet.c.gcov umf_triplet_map_x.c.gcov
gcov -o umf_di_triplet_nomap_x umf_triplet.c	; mv -f umf_triplet.c.gcov umf_triplet_nomap_x.c.gcov
gcov -o umf_di_triplet_map_nox umf_triplet.c	; mv -f umf_triplet.c.gcov umf_triplet_map_nox.c.gcov
gcov -o umf_di_triplet_nomap_nox umf_triplet.c	; mv -f umf_triplet.c.gcov umf_triplet_nomap_nox.c.gcov
