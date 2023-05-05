process FILTER_GTF_GENE_LIST {
    label 'process_low'

    container "nfcore/base"

    input:
    path gtf
    path gene_ids

    output:
    path "*filtered.gtf", emit: gtf

    script:
    def prefix =  task.ext.prefix ?: gtf.toString() - '.gtf'

    """
    grep -f ${gene_ids} ${gtf} > ${prefix}_filtered.gtf
    """
}